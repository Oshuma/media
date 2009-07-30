require 'uri'

class GithubMedia
  BASE_URL = 'http://github.com'

  # Wrapper for hosting files on Github.
  #
  #   options = {
  #     :user => 'Username',
  #     :repo => 'repo-name',
  #     :branch => 'master',
  #   }
  #   media = GithubMedia.new(options)
  def initialize(options = {})
    @options = options
    @base_path = [
      BASE_URL,
      @options[:user],
      @options[:repo],
      'raw',
      @options[:branch]
    ].join('/')
  end

  def link_to(filename)
    [@base_path, filename].join('/')
  end

end # GithubMedia
