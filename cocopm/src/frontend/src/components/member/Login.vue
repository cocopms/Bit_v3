<template>
    <div>
        <h2>로그인</h2>
        <form method="post">
            <div class="imgcontainer">
                <img src="https://www.w3schools.com/howto/img_avatar2.png" alt="Avatar" class="avatar"> <!--이미지 주소 복사-->
            </div>

            <div class="container">
                <label><b>아이디</b></label>
                <input type="text" @keyup.enter="moveToPasswd" v-model="userid" placeholder="아이디를 입력해주세요" name="userid"
                       required>
                <h3>입력한 아이디 : {{userid}}</h3>
                <label><b>비밀번호</b></label>
                <input type="password" @keyup.enter="login" v-model="passwd" placeholder="비밀번호를 입력해주세요" name="passwd"
                       required>
                <h3>입력한 비밀번호 : {{passwd}}</h3> <!--보통 id - pw - login 순서로 움직임-->
                <button @click="login" type="submit">로그인하기</button><!--이벤트, 자바로 연결-->
                <label>
                    <input type="checkbox" checked="checked" name="remember"> 로그인 유지하기
                </label>
            </div>

            <div class="container" style="background-color:#f1f1f1">
                <button type="button" class="cancelbtn">취소</button>
                <span class="psw">잊었냐 <a href="#">비밀번호?</a></span>
            </div>
        </form>
    </div>
</template>

<script>/*only json*/
import {mapState} from 'vuex' /*--VuexCounter 참조*/
export default { /*=return*/
    computed: {
        ...mapState(
            {
                fail: state => state.player.fail,
                auth: state => state.player.auth
            }
        )
    },
    data() { /* this */
        return {
            userid: '',
            passwd: ''
        }
    },

    /*        ---Vuex---
                methods: mapActions([ /!*actions로 넘겨라*!/
                'login' /!*상수 = const*!/
                moveToPasswd() {
                    document.getElementById(elementId 'passwd').focus()
                }
            ])*/
    methods: {
        login() { /* html login과 연결 */
            alert(this.userid) /* store에 있는 player에 있는 login(acctions과 연결)을 찾아라 -> actions으로 가라 */
            /* playerId, passwd는 어나니머스 함수 */
            this.$store.dispatch('player/login', {playerId: '2000003'/*this.userid*/, backNo: '40'/*this.passwd*/})
        },
        moveToPasswd() {
            document.getElementById('passwd').focus()
        }
    }
}
</script>

<style scoped> /* 범위 */
    form {border: 3px solid #f1f1f1;}
    input[type=text], input[type=password] {
        width: 100%;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        box-sizing: border-box;
    }
    button {
        background-color: #4CAF50;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        cursor: pointer;
        width: 100%;
    }
    button:hover {
        opacity: 0.8;
    }
    .cancelbtn {
        width: auto;
        padding: 10px 18px;
        background-color: #f44336;
    }
    .imgcontainer {
        text-align: center;
        margin: 24px 0 12px 0;
    }
    img.avatar {
        width: 40%;
        border-radius: 50%;
    }
    .container {
        padding: 16px;
    }
    span.psw {
        float: right;
        padding-top: 16px;
    }
    /* Change styles for span and cancel button on extra small screens */
    @media screen and (max-width: 300px) {
        span.psw {
            display: block;
            float: none;
        }
        .cancelbtn {
            width: 100%;
        }
    }
</style>