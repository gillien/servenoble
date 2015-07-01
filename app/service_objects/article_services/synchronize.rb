require 'net/http'

module ArticleServices
  class Synchronize

    attr_reader :article

    def initialize(article)
      @article = article
    end

    def call
      article.facebook  = facebook(article.uri)
      article.linkedin  = linkedin(article.uri)
      article.twitter   = twitter(article.uri)

      article.save
    end

    class << self
      def call(begin_date, end_date)
        Article.where('created_at > ? AND created_at < ?', begin_date, end_date).each do |a|
          new(a).delay.call
        end
      end
    end

    private
    def facebook(uri)
      social_service_call("http://graph.facebook.com/?id=#{uri}")['shares']
    end

    def linkedin(uri)
      social_service_call("http://cdn.api.twitter.com/1/urls/count.json?url=#{uri}")['count']
    end

    def twitter(uri)
      social_service_call("https://www.linkedin.com/countserv/count/share?url=#{uri}&format=json")['count']
    end

    def social_service_call(parse_uri)
      JSON.parse(Net::HTTP.get(URI.parse(parse_uri))) rescue {}
    end
  end
end