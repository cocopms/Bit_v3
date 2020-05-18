<template>
    <div>
        카운터: {{count}}
        <button @click="increment">+</button>
        <button @click="decrement">-</button>
    </div>
</template>

<script>
    import {mapGetters, mapActions} from 'vuex'
    export default {
        computed: mapGetters([
                'count'
            ]),
        methods: mapActions([
            'increment',
            'decrement'
        ])
    }
</script>

<style scoped>

</style>