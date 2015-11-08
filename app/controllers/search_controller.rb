require 'net/http'
require 'uri'

class SearchController < ApplicationController
  def search
    formatted_query = format_query(params['query'])
    response = request(formatted_query)

    format_response(response)
  end

  private

  def format_response(response)
    response
  end

  def format_query(query)
    words = query.split(/[^a-zA-Z0-9]/)
    formatted_query = query_template

    words.each do |word|
      term = {
        term: {
          'tags.raw' => word
        }
      }
      formatted_query['bool']['should'][0]['bool']['should'].append(term)
    end

    formatted_query['bool']['should'][1]['bool']['should']['more_like_this']['like'] = words
    JSON.parse(formatted_query)
  end

  def request(formatted_query)
    uri = URI.parse('http://example.com/search')
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri)
    request.set_form_data('query' => formatted_query)
    response = http.request(request)

    response.body
  end

  def query_template()
    {
      bool: {
        should: [{
          bool: {
            should: [
              # {
              #     "term": {
              #         "tags.raw": "Ottawa"
              #     }
              # },
              # {
              #     "term": {
              #         "tags.raw": "Toronto"
              #     }
              # }
            ],
            minimum_number_should_match: 1,
            boost: 4
          }
        },
        {
          bool: {
            should: [{
              more_like_this: {
                fields: ['text'],
                like: [
                  # "another", "index", "brown fox"
                ],
                stop_words: ["the", "of", "and", "to", "a", "in", "that", "is", "was", "he",
                   "she", "for", "it", "with", "as", "his", "her", "on", "be", "at", "by", "i"],
                min_term_freq: 1,
                min_doc_freq: 1,
                boost: 8
              }
            }]
          }
        }]
      }
    }
  end
end
