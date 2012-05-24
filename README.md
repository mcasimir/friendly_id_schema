# FriendlyIdSchema

**FriendlyIdSchema** is a micro gem that combines [FriendlyId](https://github.com/norman/friendly_id) with [ActiveRecordSchema](https://github.com/mcasimir/active_record_schema)

## Installation

``` rb
  gem 'friendly_id_schema', :git => "git://github.com/mcasimir/friendly_id_schema.git"
```


## Usage

Call `#permalink` inside a model like this:

``` rb
class Post
  permalink

  field :title
  
end
```

and then run `rails g migration` with `--from` option to let ActiveRecordSchema generate the required migration

_ex._

    rails g migration add_permalink_to_posts --from Post

### Specify a field to derive permalink
 
``` rb
class User
  field :name
  permalink :name
  
end
```

### Use history

Run these commands first:

    rails generate friendly_id
    rake db:migrate

``` rb
class Post
  permalink :history => true

  field :title
  
end
```

