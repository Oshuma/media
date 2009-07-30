require 'github_media'
require 'test/unit'

class GithubMediaTest < Test::Unit::TestCase
  def setup
    @opts = {
      :user => 'Username',
      :repo => 'repo-name',
      :branch => 'master',
    }
    @base_path = "http://github.com/#{@opts[:user]}/#{@opts[:repo]}/raw/#{@opts[:branch]}"
  end

  def teardown
  end

  def test_base_path
    media = GithubMedia.new(@opts)
    assert_equal(@base_path, media.instance_variable_get(:@base_path))
  end

  def test_link_to
    media = GithubMedia.new(@opts)
    link = "#{@base_path}/somefile.txt"
    assert_equal(link, media.link_to('somefile.txt'))
  end
end
