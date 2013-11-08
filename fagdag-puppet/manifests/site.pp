import 'users'
import 'nginx'

node default {
  include users
  include nginx
}
