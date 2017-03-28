package com.lnk.jxc.config;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.autoconfigure.jdbc.DataSourceBuilder;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.PropertySource;

/**
 * <p>title:数据源配置类</p>
 * <p>description:配置主、从多个数据源</p>
 * @author Nick Liu
 * @time 2017年3月8日 下午2:45:44
 */
@Configuration
@ConfigurationProperties(prefix = "db.datasource")
@PropertySource(value = "classpath:db.properties")
public class DataSourceConfiguration {

    private final static Logger LOG = LoggerFactory.getLogger(DataSourceConfiguration.class);
    /**
     * 数据源类型
     */
    private Class<? extends DataSource> type;

    /**
     * 创建主数据源
     * @return DataSource
     */
    @Bean(name = "dataSource")
    @Primary
    @ConfigurationProperties(prefix = "db.master")
    public DataSource dataSource() {
        LOG.info("-------------------- dataSource init ---------------------");
        return DataSourceBuilder.create().type(type).build();
    }

    public Class<? extends DataSource> getType() {
        return type;
    }

    public void setType(Class<? extends DataSource> type) {
        this.type = type;
    }
}
