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
    @options   = options
    @base_path = create_base_path
  end

  def link_to(filename)
    URI.parse([@base_path, filename].join('/')).to_s
  end

  private

  def create_base_path
    URI.parse([
      BASE_URL,
      @options[:user],
      @options[:repo],
      'raw',
      @options[:branch]
    ].join('/')).to_s
  end

end # GithubMedia
