/**
 * Javascript class wrapper for hosting files on Github.
 *
 * var options = {
 *  user:   'Username',
 *  repo:   'repo-name',
 *  branch: 'master',
 * }
 * var gitMedia = new GithubMedia(options);
 *
 * @constructor
 * @param {Object} options A hash of options.
 * @return A GithubMedia instance.
 * @type GithubMedia
 */
function GithubMedia(options) {
  if (!options) return false;

  this.initialized = false;
  this.base_url    = 'http://github.com';
  this.options     = options;

  this.initialized = true;
}

/**
 * Returns a URL for the given filename.
 *
 * @returns GithubMedia instance.
 * @type GithubMedia
 */
GithubMedia.prototype.link_to = function(filename) {
  if (!this.initialized) return false;
  var link_opts = [
    this.base_url,
    this.options.user,
    this.options.repo,
    'raw',
    this.options.branch,
    filename
  ];
  return link_opts.join('/');
};
