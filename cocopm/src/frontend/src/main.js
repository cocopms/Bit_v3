import Vue from 'vue'
import Vuex from 'vuex'
import App from './App.vue'
import vuetify from './plugins/vuetify'; /*내장*/
import router from './router'
import {store} from './store'

Vue.config.productionTip = false
Vue.use(Vuex)
new Vue({
  vuetify,
  router,
  Vuex,
  store,
  render: h => h(App)
}).$mount('#app')
/*자바와는 다르게 여기에 import 한 번만 하면 모든 vue에서 사용할 수 있음*/