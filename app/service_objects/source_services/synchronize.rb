module SourceServices
  class Synchronize
    def call
      Source.all.map { |s| delay.call_for(s) }
    end

    def call_for(source)
      latest_entry = source.articles.last

      Feedjira::Feed.fetch_and_parse(source.uri).entries.map do |e|
        return [] if latest_entry.present? && e.entry_id != latest_entry.entry_id

        source.articles.create(
          entry_id:     e.entry_id,
          uri:          e.url,
          description:  e.summary,
          title:        e.title,
          categories:   e.categories
        )
      end
    end
  end
end