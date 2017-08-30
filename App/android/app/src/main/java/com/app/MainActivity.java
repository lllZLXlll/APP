package com.app;

import com.facebook.react.ReactActivity;

import android.content.Intent; // <--- 屏幕方向控制组件
import android.content.res.Configuration; // <--- 屏幕方向控制组件

public class MainActivity extends ReactActivity {

    /**
     * Returns the name of the main component registered from JavaScript.
     * This is used to schedule rendering of the component.
     */
    @Override
    protected String getMainComponentName() {
        return "App";
    }

    // <--- 屏幕方向控制组件
    @Override
      public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        Intent intent = new Intent("onConfigurationChanged");
        intent.putExtra("newConfig", newConfig);
        this.sendBroadcast(intent);
    }
}
