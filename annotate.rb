=begin

|本期版本|上期版本 
|:---:|:---:
`Thu Jun 23 14:49:04 CST 2022` | 


## Ref

* [https://github.com/ctran/annotate_models](https://github.com/ctran/annotate_models)

=end

insert_into_file 'Gemfile', :after => /:development, :test do/ do
  <<-EOS.strip_heredoc.indent(2)
    gem 'annotate', '~> 3.2'
  EOS
end

run_bundle

generate "annotate:install"

git add: "."
git commit: %Q<-m 'Annotate'>