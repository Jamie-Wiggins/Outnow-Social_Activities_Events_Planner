class TwitterApi

    def self.our_public_tweets(username)
        client.user_timeline(username, count: 1, exclude_replies: true, include_rts: false)
    end

    def self.justin_tweets
        client.search("to:justinbieber marry me", result_type: "recent").take(3).collect do |tweet|
        "#{tweet.user.screen_name}: #{tweet.text}"
        end
    end

    def self.test_tweets(user)
        client.search("from:#{user}", result_type: "recent").take(20).collect
    end

    def self.client
        @client ||= Twitter::REST::Client.new do |config|    
            config.consumer_key       = 'Q4etGJuOlXtLcJMj32d49fhFw'
            config.consumer_secret    = 'CyWrjNbso467hzAALUjLOBYlZO5nPWFfWnYT5gPKzOU7N7CIJw'
        end
    end
end