<template>
    <div id="app">
        <div v-if="auth"> <!-- 관리자이냐 아니냐 -->
            <Layout>
                <template>
                    <template #header="self">
                        <router-link to="/"><h1 class="title">{{self.title}}</h1></router-link> <!--a-->
                        <router-link to="/login"><span class="mypage">{{self.login}}</span></router-link>
                        <router-link to="/join"><span class="logout">{{self.join}}</span></router-link>
                    </template>

                    <template #sidebar>
                        <h1>광고판</h1>
                    </template>
                </template>
            </Layout>
        </div>

        <div v-else>
            <Layout>
                <template #header="self">
                    <router-link to="/"><h1 class="title">{{self.title}}</h1></router-link> <!--a-->
                    <router-link to="/mypage"><span class="mypage">{{self.mypage}}</span></router-link>
                    <span @="logout" class="logout">{{self.logout}}</span>
                </template>

                <template #sidebar>
                    <h1>광고판</h1>
                    <ul class="menu">
                        <li v-for="i of sidebars" :key="i.menu"> &lt;!&ndash;self 생략가능&ndash;&gt;
                            <router-link :to="i.link">{{i.menu}}</router-link> &lt;!&ndash;self 생략가능&ndash;&gt;
                        </li>
                    </ul>
                </template>

                <template #content>
                    <router-view/>
                </template>
                <template #footer="self">
                    <h3 id="footer">{{self.footer}}</h3>
                </template>
            </Layout>
        </div>
    </div>
</template>

<script>
    import Layout from "../components/common/Layout"
    import {mapState} from 'vuex'

    export default {
        computed: {
            ...mapState(
                {
                    auth: state => state.player.auth
                }
            )
        },
        components: {Layout},
        data: () => {
            return {
                sidebars: [
                    {menu: '등록', link: '/register'}, /*림크가 있어야함*/
                    {menu: '목록', link: '/list'},
                    {menu: '검색', link: '/search'},
                    {menu: '수정', link: '/update'},
                    {menu: '삭제', link: '/delete'},
                    {menu: '회원수', link: '/counter'}
                ]
            }
        },

        created() {
        },
        methods: {
            logout() {
                alert('로그아웃')
            },
            menu(i) {
                switch (i) {
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
    ul.menu {
        position: relative;
        padding: 5px;
        list-style: none;
        font-style: italic;
    }

    .title {
        width: 300px;
        margin: 0 auto
    }

    .mypage, .login {
        margin-right: 50px;
        float: right
    }

    .logout, .join {
        margin-right: 50px;
        float: right
    }

    #footer {
        width: 300px;
        margin: 0 auto
    }
</style>