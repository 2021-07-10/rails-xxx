# Rails Application Templates

**`app_name`**

> `snake-api` vs `snake_api`

* [`5.2.6+`](https://github.com/rails/rails/blob/0b3a63fe07507fca5b2cab6409e85789a46ed624/railties/lib/rails/generators/app_name.rb#L9) `.tr('\\', "").tr("-. ", "_")`
* [`5.2.6`](https://github.com/rails/rails/blob/v5.2.6/railties/lib/rails/generators/rails/app/app_generator.rb#L497) `.tr('\\', "").tr(". ", "_")`


## Github

* 测试信息

## Initialize

```bash
rails new snake_api -T -d mysql --api
```

```bash
bin/rails app:template LOCATION=
```

## Ref

* [Rails Application Templates — Ruby on Rails Guides](https://guides.rubyonrails.org/rails_application_templates.html)