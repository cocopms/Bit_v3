const state = { /*회원수 카운트와 히스토리*/
    count: 0,
    history: []
}

const counter = {
    increment({commit}) {
        commit('increment')
    },
    decrement({commit}) {
        commit('decrement')
    },
    incrementIfOdd({commit, state}) {
        if ((state.count + 1) % 2 === 0)
            commit('increment')
        incrementAsync({commit})
        {
            setTimeout(() => {
                commit('increment')
            }, 1000)
        }
    }
}

export default {
    name: 'counter',
    namespaced: true,
    state,
    actions: counter,
    mutations,
    getters
}