import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"

const images = require.context('../images', true)
const imagePath = (name) => images(name, true)

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "controllers"

import "scripts/shared" // js共享
import "scripts/frontend" // js前端

import "styles/shared" // css共享
import "styles/frontend"// css前端

// 文字編輯器
import "styles/application"
require("trix")
require("@rails/actiontext")
