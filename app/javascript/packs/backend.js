import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
// 文字編輯器
import "styles/application"
require("trix")
require("@rails/actiontext")

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "controllers"

import "scripts/shared" // js共享
import "scripts/backend" // js後端

import "styles/shared" // css共享
import "styles/backend" // css後端
