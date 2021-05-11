import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "controllers"

import "scripts/shared" // js共享
import "scripts/frontend" // js前端

import "styles/shared" // css共享
import "styles/frontend"// css前端