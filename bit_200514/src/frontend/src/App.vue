<template>
  <v-app>
    <div id="login">
      <v-app>
        <main>
          <v-container fluid fill-height class="loginOverlay">
            <v-layout flex align-center justify-center>
              <v-flex xs12 sm4 elevation-6>
                <v-toolbar class="pt-5 blue darken-4">
                  <v-toolbar-title class="white--text"><h4>Welcome Back</h4></v-toolbar-title>
                </v-toolbar>
                <v-card>
                  <v-card-text class="pt-4">
                    <div>
                      <v-form v-model="valid" ref="form">
                        <v-text-field
                                label="Enter your e-mail address"
                                v-model="email"
                                :rules="emailRules"
                                required
                        ></v-text-field>
                        <v-text-field
                                label="Enter your password"
                                v-model="password"
                                min="8"
                                :append-icon="e1 ? 'visibility' : 'visibility_off'"
                                :append-icon-cb="() => (e1 = !e1)"
                                :type="e1 ? 'password' : 'text'"
                                :rules="passwordRules"
                                counter
                                required
                        ></v-text-field>
                        <v-layout justify-space-between>
                          <v-btn @click="submit" :class=" { 'blue darken-4 white--text' : valid, disabled: !valid }">Login</v-btn>
                          <a href="">Forgot Password</a>
                        </v-layout>
                      </v-form>
                    </div>
                  </v-card-text>
                </v-card>
              </v-flex>
            </v-layout>
          </v-container>
          <a href="https://unsplash.com/photos/i6Wc5qZO5MQ" target="_blank">
            <v-card class="photoCredit teal">
              <v-card-title>
                <div class="white--text">
                  Photo by Tatyana Dobreva on Unsplash
                </div>
              </v-card-title>
            </v-card>
          </a>
        </main>
      </v-app>
    </div>
    <v-content>
      <Home/> <!--Component명-->
    </v-content>
  </v-app>
</template>

<script>
import Home from './components/Home'; <!--Component명-->

export default {
  name: 'App', <!--Component명-->

  components: {
    Home,
  },

  data: () => ({
    //
  }),
};
</script>
<style>
  #app {
    background-image: url("https://images.unsplash.com/photo-1497733942558-e74c87ef89db?dpr=1&auto=compress,format&fit=crop&w=1650&h=&q=80&cs=tinysrgb&crop=");
    background-size: cover;
    overflow:hidden;
  }

  .loginOverlay {
    background:rgba(33,150,243,0.3);
  }

  .photoCredit{
    position: absolute;
    bottom: 15px;
    right: 15px;
  }
</style>