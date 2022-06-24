=begin

|本期版本|上期版本 
|:---:|:---:
`Thu Jun 23 14:49:04 CST 2022` | 


## Ref

* [How to Add Rails Console Helper Methods](https://www.dailysmarty.com/posts/how-to-add-rails-console-helper-methods)
* [ActiveSupport::Concern](https://api.rubyonrails.org/classes/ActiveSupport/Concern.html)
* [Rails::ConsoleMethods](https://api.rubyonrails.org/classes/Rails/ConsoleMethods.html)
* [Rails Console Shortcuts, Tips, and Tricks](https://pragmaticstudio.com/tutorials/rails-console-shortcuts-tips-tricks)
=end



def source_paths
  Array(super) +
  [File.expand_path('../templates', __FILE__)]
end

copy_file 'console_helper.rb', 'lib/console_helper.rb'

inject_into_class 'config/application.rb', 'Application' do
  <<-EOS.strip_heredoc.indent(4)
    console do
      require 'console_helper'
      Rails::ConsoleMethods.include(ConsoleHelper)
    end
  EOS
end

git add: "."
git commit: %Q<-m 'ConsoleHelper'>