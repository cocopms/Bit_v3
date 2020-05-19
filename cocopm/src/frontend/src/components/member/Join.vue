<template>
    <div>
        <h2>회원 가입</h2>
        <form method="post">
            <div class="container">
                <label><b>아이디</b></label>
                <input type="text" @keyup.enter="moveToPasswd" v-model="userid" placeholder="아이디를 입력해주세요" name="userid" required>
                <h5>입력한 아이디 : {{ userid }}</h5>
                <label><b>비밀번호</b></label>
                <input type="password" v-model="passwd" placeholder="비밀번호를 입력해주세요" name="passwd" required>
                <h5>입력한 비밀번호 : {{ passwd }}</h5>

                <div id='example-3'>
                    <h3>취미</h3>
                    <input type="checkbox" id="java" value="Jack" v-model="checkedNames">
                    <label for="java">Java</label>
                    <input type="checkbox" id="javascript" value="John" v-model="checkedNames">
                    <label for="javascript">Javascript</label>
                    <input type="checkbox" id="sql" value="Mike" v-model="checkedNames">
                    <label for="sql">SQL</label>
                    <br>
                    <span>체크한 이름: {{ checkedNames }}</span>
                </div>
                <textarea v-model="gita" placeholder="여러줄을 입력해보세요"></textarea>
                <br>
                <span>입력내용</span>
                <p style="white-space: pre-line">{{ gita }}</p>
                <br>
                <div>
                    <h3>성별 : </h3>
                    <input type="radio" v-model="gender" id="female" value="female">
                    <label for="female">여성</label>
                    <input type="radio" v-model="gender" id="male" value="male">
                    <label for="male">남성</label>
                    <br>
                    <span>선택: {{ gender }}</span><br>
                </div>
                <div>
                    <select v-model="telecom">
                        <h3>통신사</h3>
                        <option disabled value="">Please select one</option>
                        <option>stk</option>
                        <option>kt</option>
                        <option>lg</option>
                    </select>
                    <span>선택: {{ telecom }}</span>
                </div>
                <br>
                <div>
                    <h3>개인정보 동의</h3>
                    <input
                            type="checkbox"
                            v-model="confirm"
                            true-value="yes"
                            false-value="no">
                    <span>selected : {{ confirm }}</span>
                </div>

                <button @click="join" type="submit">회원가입</button>
            </div>
        </form>
    </div>
</template>

<script>
    import {mapActions} from 'vuex'

    export default {
        data() {
            return {
                userid: '',
                passwd: '',
                gita: '',
                checkedNames: [],
                gender: '',
                telecom: '',
                confirm: false
            }
        },
        methods: mapActions([
            'join'
        ])
    }
</script>

<style scoped>
    body {
        font-family: Arial, Helvetica, sans-serif;
    }

    form {
        border: 3px solid #f1f1f1;
    }

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

    .container {
        padding: 16px;
    }
</style>