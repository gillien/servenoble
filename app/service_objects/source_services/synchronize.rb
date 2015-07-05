module SourceServices
  class Synchronize

    attr_reader :source

    def initialize(source)
      @source = source
    end

    def call
      latest_entry      = source.articles.last

      filtered_entries  = Feedjira::Feed.fetch_and_parse(source.uri).entries.take_while do |e|
        latest_entry.nil? || e.entry_id == latest_entry.entry_id
      end

      created_entries   = filtered_entries.map do |e|
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

      created_entries.count {|o| o.valid? }
    end

    class << self
      def call
        Source.all.map { |s| new(s).delay.call }
      end
    end
  end
end