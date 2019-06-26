package com.bmuschko.messenger

import org.junit.Test

class MessengerTest {
    def messenger = new Messenger()

    @Test
    void "can get message"() {
        def msg = messenger.getMessage()
        assert msg == 'Hello World!'
    }
}