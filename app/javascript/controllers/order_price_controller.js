import ApplicationController from "./application_controller"
import { FetchRequest } from '@rails/request.js'

export default class extends ApplicationController {
  static values = {
    cartId: Number,
    totalPrice: Number
  }

  static targets = [
    'discount',
    'totalPriceWithDiscount',
  ]

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

  #changeBlocksValue(discountValue) {
    const finalPrice = Math.max(this.totalPriceValue - discountValue, 0)
    this.discountTarget.innerHTML = this.#numberToRUCurrency(discountValue)
    this.totalPriceWithDiscountTarget.innerHTML = this.#numberToRUCurrency(finalPrice)
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
      const request = new FetchRequest('patch', `/carts/${this.cartIdValue}`, { body: params })
      const response = await request.perform()
      if (response.ok) {
        this.#changeBlocksValue(discountValue)
      }
      return response
    } catch(error) {
      console.warn(error)
    }
  }
}
