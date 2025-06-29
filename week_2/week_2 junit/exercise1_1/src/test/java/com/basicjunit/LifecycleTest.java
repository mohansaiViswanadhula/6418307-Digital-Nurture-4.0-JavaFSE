package com.basicjunit;

import org.junit.Before;
import org.junit.After;
import org.junit.Test;
import static org.junit.Assert.*;

public class LifecycleTest {

    private Calculator calculator;

    @Before
    public void setUp() {
        calculator = new Calculator();
        System.out.println("Setup complete");
    }

    @After
    public void tearDown() {
        calculator = null;
        System.out.println("Teardown done");
    }

    @Test
    public void testAdd() {
        int result = calculator.add(10, 5);

        assertEquals(15, result);
    }

    @Test
    public void testSquare() {
        int result = calculator.square(4);

        assertEquals(16, result);
    }
}

