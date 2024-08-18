export const helloMixin = controller => {
  Object.assign(controller, {
    hello() {
      console.log('showOverlay');
    },
  })
}