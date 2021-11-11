package com.whale.biz.monitor.controller;

import com.whale.biz.monitor.server.Server;
import com.whale.base.api.R;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 服务器监控
 *
 * @author sy
 */
@RestController
@RequestMapping("/monitor/server")
public class ServerController {

    @GetMapping()
    public R getInfo() throws Exception {
        Server server = new Server();
        server.copyTo();
        return R.ok(server);
    }
}
