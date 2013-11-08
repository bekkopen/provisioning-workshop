import 'users'
import 'nginx'
import 'apps'

node default {
  include users
  include nginx
  include apps
}
