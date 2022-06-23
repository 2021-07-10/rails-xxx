=begin

|本期版本|上期版本 
|:---:|:---:
`Thu Jun 23 14:08:11 CST 2022` | 

=end

puts "需要安装依赖: dotenv"

append_to_file '.env.template' do
  <<-EOS.strip_heredoc
    #{app_name.upcase}_DATABASE_HOST=127.0.0.1
    #{app_name.upcase}_DATABASE_USERNAME=root
    #{app_name.upcase}_DATABASE_PASSWORD=
  EOS
end

run 'cp .env.template .env.development.local'

# production
gsub_file 'config/database.yml', /username: #{app_name}/, ''
gsub_file 'config/database.yml', /password: <%.*/, ''

# default
# gsub_file 'config/database.yml', /(host:) localhost/, "\\1 <%= ENV['#{app_name.upcase}_DATABASE_HOST'] %>" 
gsub_file 'config/database.yml', "socket: /tmp/mysql.sock", "host: <%= ENV['#{app_name.upcase}_DATABASE_HOST'] %>" 
gsub_file 'config/database.yml', /(username:) root/, "\\1 <%= ENV['#{app_name.upcase}_DATABASE_USERNAME'] %>" 
gsub_file 'config/database.yml', /(password:)/, "\\1 <%= ENV['#{app_name.upcase}_DATABASE_PASSWORD'] %>" 

rails_command "db:create"
rails_command "db:migrate"

git add: "."
git commit: %Q<-m 'MySQL Config'>