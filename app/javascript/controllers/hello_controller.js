import ApplicationController from "./application_controller"
import { helloMixin } from "../mixins/hello";
export default class extends ApplicationController {
  connect() {
    helloMixin(this)
    super.sayHi()
    this.hello()
  }
}
