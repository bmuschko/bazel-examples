package com.bmuschko;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

@RunWith(Suite.class)
@SuiteClasses({
    com.bmuschko.messenger.MessengerTest.class
})
public class AllTests {}