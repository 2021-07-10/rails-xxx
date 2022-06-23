=begin

|本期版本|上期版本 
|:---:|:---:
`Thu Jun 23 15:14:26 CST 2022` | 


## Ref

* [https://github.com/james2m/seedbank](https://github.com/james2m/seedbank)

=end

insert_into_file 'Gemfile', :after => /:development, :test do/ do
  <<-EOS.strip_heredoc.indent(2)
    gem 'seedbank', '~> 0.5.0'
  EOS
end

run_bundle

create_file 'db/seeds/development/.keep'


git add: "."
git commit: %Q<-m 'Seedbank'>