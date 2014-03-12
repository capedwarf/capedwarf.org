require 'wget_wrapper'
require 'js_minifier'
require 'css_minifier'
require 'html_minifier'
require 'file_merger'
require 'less_config'
require 'symlinker'
require 'breadcrumb'
require 'authors_helper'
require 'releases'

Awestruct::Extensions::Pipeline.new do
  helper Awestruct::Extensions::Partial
  helper Awestruct::Extensions::Breadcrumb
  helper Awestruct::Extensions::AuthorsHelper
  extension Awestruct::Extensions::WgetWrapper.new
  transformer Awestruct::Extensions::JsMinifier.new
  transformer Awestruct::Extensions::CssMinifier.new
  transformer Awestruct::Extensions::HtmlMinifier.new
  extension Awestruct::Extensions::FileMerger.new
  extension Awestruct::Extensions::LessConfig.new
  extension Awestruct::Extensions::Symlinker.new
  extension Awestruct::Extensions::Posts.new('/news', :posts)
  extension Awestruct::Extensions::Paginator.new(:posts, '/news/index', :per_page => 3)
  extension Awestruct::Extensions::Tagger.new(:posts, '/news/index', '/news/tags', :per_page=>3 )
  extension Awestruct::Extensions::TagCloud.new(:posts, '/news/tags/index.html')
  extension Awestruct::Extensions::Indexifier.new
  extension Awestruct::Extensions::Atomizer.new(:posts, '/news.atom', {:feed_title=>'CapeDwarf News', :template=>'_layouts/template.atom.haml'})
  extension Awestruct::Extensions::Posts.new('/blog', :blogposts)
  extension Awestruct::Extensions::Paginator.new(:blogposts, '/blog/index', :per_page => 1)
  extension Awestruct::Extensions::Tagger.new(:blogposts, '/blog/index', '/blog/tags', :per_page=>1 )
  extension Awestruct::Extensions::TagCloud.new(:blogposts, '/blog/tags/index.html')
  extension Awestruct::Extensions::Indexifier.new
  extension Awestruct::Extensions::Atomizer.new(:blogposts, '/blog.atom', {:feed_title=>'CapeDwarf Blog', :template=>'_layouts/template.atom.haml'})
  extension Release.new
end

