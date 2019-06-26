package com.bmuschko

import com.bmuschko.messenger.Messenger

class HelloWorld {
    static void main(String[] args) {
        def messenger = new Messenger()
        println messenger.getMessage()
    }
}