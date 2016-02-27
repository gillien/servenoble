module SourceServices
  ##
  # Synchronize new articles for a given Source
  class Synchronize
    attr_reader :source

    def initialize(source)
      @source = source
    end

    def call
      filtered_entries.map do |e|
        source.articles.create(
          entry_id: e.entry_id, uri: e.url, description:  e.summary, title: e.title,
          categories: e.categories, author: e.author, published_at: e.published
        )
      end.count(&:valid?)
    end

    def filtered_entries
      @filtered_entries ||=
        Feedjira::Feed.fetch_and_parse(source.uri).entries.take_while do |e|
          source.articles.last.nil? || e.entry_id == source.articles.last.entry_id
        end
    end

    class << self
      def call
        Source.all.map { |s| new(s).delay.call }
      end
    end
  end
end
