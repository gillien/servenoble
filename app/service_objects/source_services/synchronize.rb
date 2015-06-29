require 'net/http'

module SourceServices
  class Synchronize
    def call
      Source.all.each {|s| s.synchronize }

      Article.where('created_at > :one_month_ago', one_month_ago: 1.month.ago.utc).each do |a|
        call_for(a)
      end
    end

    def call_for(article)
      article.facebook  = facebook(article.uri)
      article.linkedin  = linkedin(article.uri)
      article.twitter   = twitter(article.uri)

      article.save
    end
    handle_asynchronously :call_for

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