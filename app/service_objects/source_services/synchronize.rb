module SourceServices
  class Synchronize

    attr_reader :source

    def initialize(source)
      @source = source
    end

    def call
      latest_entry = source.articles.last

      Feedjira::Feed.fetch_and_parse(source.uri).entries.map do |e|
        break if latest_entry.present? && e.entry_id != latest_entry.entry_id

        source.articles.create(
          entry_id:     e.entry_id,
          uri:          e.url,
          description:  e.summary,
          title:        e.title,
          categories:   e.categories,
          author:       e.author,
          published_at: e.published
        )
      end
    end

    class << self
      def call
        Source.all.map { |s| new(s).delay.call }
      end
    end
  end
end