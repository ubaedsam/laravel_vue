import Vue from 'vue'

import VueRouter from 'vue-router';
Vue.use(VueRouter)

const Home = require('../pages/Home.vue').default;
const About = require('../pages/About.vue').default;
import NotFound from '../pages/NotFound.vue'
import User from '../pages/User.vue'
import Profile from '../pages/Profile.vue'
import Register from '../pages/Register.vue'
import Edit from '../pages/Edit.vue'
import Upload from '../pages/UploadPhoto.vue'

// Pengganti Route dari file web.php dari folder routes
const routes = [
    {
        name: 'Home', // Nama Route
        path: '/home', // URL
        component: Home // View / Halaman Menu
    },
    {
        name: 'About',
        path: '/about',
        component: About
    },
    {
        name: 'User',
        path: '/user',
        component: User,
    },
    {
        name: 'Register',
        path: '/user/create',
        component: Register,
    },
    {
        name: 'Profile',
        path: '/user/:id?',
        component: Profile,
        props: true // Untuk menyimpan object data atau data yang lain
    },
    {
        name: 'Upload',
        path: '/user/:id?/photo',
        component: Upload,
        props: true // Untuk menyimpan object data atau data yang lain
    },
    {
        name: 'Edit',
        path: '/user/:id?/edit',
        component: Edit,
        props: true // Untuk menyimpan object data atau data yang lain
    },
    {
        path: '*',
        component: NotFound
    },
]

const router = new VueRouter({
    linkActiveClass: 'active',
    mode: 'history',
    routes
})

export default router