from urlparse import urljoin

class GithubMedia(object):
  # Wrapper for hosting files on Github.
  #
  #   options = {
  #     'user': 'Username',
  #     'repo': 'repo-name',
  #     'branch': 'master',
  #   }
  #   media = GithubMedia(options)
  def __init__(self, options = {}):
    self.BASE_URL = 'http://github.com'
    self.options   = options
  
  def create_base_path(self):
    return urljoin(self.BASE_URL,
                   "/".join([self.options['user'],
                   self.options['repo'],
                   'raw',
                   self.options['branch'],]))
  base_path = property(create_base_path)

  def link_to(self, filename):
    return "/".join([self.base_path, filename])

