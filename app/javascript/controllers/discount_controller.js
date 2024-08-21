import ApplicationController from "./application_controller"
import { FetchRequest } from '@rails/request.js'

export default class extends ApplicationController {
  connect() {
    this.cartId = this.element.dataset.cartId
    this.totalPrice = this.element.dataset.totalPrice
    this.$discountBlock = document.querySelector('.js-discount--value')
    this.$finalPriceBlock = document.querySelector('.js-discount--final-price')
  }

  #changeBlocksValue(discountValue) {
    const finalPrice = Math.max(this.totalPrice - discountValue, 0)
    this.$discountBlock.innerHTML = this.#numberToRUCurrency(discountValue)
    this.$finalPriceBlock.innerHTML = this.#numberToRUCurrency(finalPrice)
  }

  #numberToRUCurrency(value) {
    return Intl.NumberFormat('ru-RU', {
      style: 'currency',
      currency: 'RUB',
      minimumFractionDigits: 0,
    }).format(value)
  }

  async #updateDiscountForCart(params, discountValue) {
    try {
      const request = new FetchRequest('patch', `/carts/${this.cartId}`, { body: params })
      const response = await request.perform()
      if (response.ok) {
        this.#changeBlocksValue(discountValue)
      }
      return response
    } catch(error) {
      console.warn(error)
    }
  }

  onChangeWithoutRequest(event) {
    const discountValue = event.target.value
    this.#changeBlocksValue(discountValue)
  }

  onChange(event) {
    const discountValue = event.target.value
    const params = JSON.stringify({
      cart: {
        discount: discountValue
      }
    })
    this.#updateDiscountForCart(params, discountValue)
  }
}
