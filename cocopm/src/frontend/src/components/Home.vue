<template>
    <div id="app">
        <layout>
            <template #header="header">
                <h1>{{header.title}}</h1>
                <h3>{{header.login}}</h3>
                <h3>{{header.signup}}</h3>
            </template>
        </layout>
    </div>
</template>

<script>
    import Layout from "@/components/common/Layout";
    export default {
        name: "Home",
        components: {Layout},
        data: ()=>{
            return {

            }
        }
    }
</script>