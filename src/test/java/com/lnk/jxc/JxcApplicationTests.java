package com.lnk.jxc;

import java.text.DecimalFormat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class JxcApplicationTests {

    @Test
    public void contextLoads() {
        float scale = 34.234323f;
        DecimalFormat fnum = new DecimalFormat("##0.00");
        String dd = fnum.format(scale);
        System.out.println(dd);
    }

}
