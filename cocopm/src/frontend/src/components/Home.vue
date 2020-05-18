<template>
    <div id="app">
        <Layout>
            <template #header="self">
                <router-link to="/home"><h1 id="title">{{self.title}}</h1></router-link>
                <router-link to="/login"><span id="login">{{self.login}}</span></router-link> <!--a-->
                <router-link to="/join"><span id="join">{{self.join}}</span></router-link>
                <router-link to="/calculator"><span id="calculator">{{self.calculator}}</span></router-link>
            </template>
            <template #sidebar>
                <ul class="menu">
                    <li v-for="i of sidebars" :key="i.menu"> <!--self 생략가능-->
                        <router-link :to="i.link">{{i.menu}}</router-link> <!--self 생략가능-->
                    </li>
                </ul>
            </template>
            <template #content>
                <router-view/>
            </template>
            <template v-if="ok">
                <router-link to="/counter"></router-link>
            </template>
            <template #footer="self">
                <h3 id="footer">{{self.footer}}</h3>
            </template>
        </Layout>
    </div>
</template>

<script>
    import Layout from "../components/common/Layout";
    export default {
        /*name: "Home",*/ /*생략가능*/
        components: {Layout},
        data: ()=>{
            return {
                sidebars: [
                    {menu: '등록', link:'/register'}, /*림크가 있어야함*/
                    {menu: '목록', link:'/list'},
                    {menu: '검색', link:'/search'},
                    {menu: '수정', link:'/update'},
                    {menu: '삭제', link:'/delete'},
                    {menu: '회원수', link:'/counter'}
                ]
            }
        },
        methods: {
            menu(i) {
                switch(i) {
                    case "등록":
                        alert(1)
                        break;
                    case "목록":
                        alert(2)
                        break;
                    case "검색":
                        alert(3)
                        break;
                    case "수정":
                        alert(4)
                        break;
                    case "삭제":
                        alert(5)
                        break;
                    case "회원수":
                        alert(6)
                        break;
                }
            }
        }
    }
</script>
<style scoped>
    ul.menu{
        position: relative;
        padding: 5px;
        list-style: none;
        font-style: italic;
    }
</style>