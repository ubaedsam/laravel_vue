<template>
    <div>
        <h1>Register</h1>
        <form action="/users/register" @submit.prevent="handleSubmit" method="post">
            <div class="input-group">
                <label for="name">Name</label>
                <input type="text" v-model="form.name">
                <br>
                <div class="error" v-if="errors.name">
                    {{ errors.name[0] }}
                </div>
            </div>
            <div class="input-group">
                <label for="email">Email</label>
                <input type="text" v-model="form.email">
                <br>
                <div class="error" v-if="errors.email">
                    {{ errors.email[0] }}
                </div>
            </div>
            <div class="input-group">
                <label for="Password">Password</label>
                <input type="text" v-model="form.password">
                <br>
                <div class="error" v-if="errors.password">
                    {{ errors.password[0] }}
                </div>
            </div>

            <button type="submit">Register</button>
        </form>
    </div>
</template>

<script>
export default {
    data() {
        return {
            form: {
                name: '',
                email: '',
                password: ''
            },
            errors: {},
        }
    },
    methods: {
        handleSubmit() {
            axios.post('/api/users/register', this.form).then((response) => {
                if (response.data.status) {
                    this.$noty.success(response.data.message)
                    
                    this.$router.push({
                        name: 'User'
                    })
                }
            }).catch((error) => {
                // Cara 1 Menggunakan validasi biasa
                // if (error.response.status == 422) {
                //     this.errors = error.response.data.errors
                // }

                // Cara 2 Menggunakan validasi response json
                if (error.response.status == 403) {
                    this.errors = error.response.data.message
                }
            })
        }
    }
}
</script>

<style>
.input-group {
    margin-bottom: 5px;
}
</style>