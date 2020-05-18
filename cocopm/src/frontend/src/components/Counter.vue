<template>
    <div>
        <div>{{ count }}</div>
        <div @click="increment" class="btn operator">클릭수 올리기</div>
        <div @click="reset" class="btn operator">초기화</div>
    </div>
</template>

<script>
    export default {
        data() { /*state*/
            return {
                count: 0 /*초기화*/
            }
        },
        methods: {
            increment () {
                this.count++ /*반드시 this를 붙여야함*/
            },
        reset() {
                this.count = '0'
            }
        }
    }
</script>

<style scoped>

</style>