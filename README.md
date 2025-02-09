### cstery-mall

欢迎来到 **cstery-mall** 后端项目，本项目基于 **Spring Boot** 实现，负责处理电商平台的核心业务逻辑和数据管理。

对应的前端项目: [https://github.com/fjc663/cheng-stery-mall](https://github.com/fjc663/cheng-stery-mall)

---

## 项目概述

- **用户端后端服务**：提供用户注册、登录、商品浏览、购物车、订单等业务接口。
- **管理端后端服务**：提供商品管理、订单管理、用户管理、统计报表等功能接口。

### 主要技术栈：

- **Spring Boot**：快速构建 RESTful API 服务。
- **MySQL**：关系型数据库，用于存储用户、商品、订单等信息。
- **Spring Security**：用户认证与授权。
- **Swagger**：用于生成 API 文档和测试接口。
- **Maven**：项目构建和依赖管理。

---

## 运行项目

### 先决条件

- **Java 17** 
- **Maven**
- **MySQL 数据库**

### 安装步骤

1. **克隆仓库**：
   ```bash
   git clone https://github.com/fjc663/cheng-stery-mall.git
   ```

2. **配置数据库**：

   在 MySQL 中创建数据库，命名为 `cstery_mall_db`。 
   并在 `application.yml` 文件中修改对应的配置（如数据库用户名和密码）连接上数据库。
   然后运行根目录下的`cstery-mall.sql`脚本初始化数据库的数据

3. **安装依赖**：
   在项目根目录下运行：
   ```bash
   mvn clean install
   ```

4. **运行项目**：
   在项目根目录下运行以下命令启动 Spring Boot 应用：
   ```bash
   mvn spring-boot:run
   ```

   应用将启动并监听默认端口 `8080`。

5. **访问 API 文档**：
   项目启动后，访问 [http://localhost:8080/doc.html](http://localhost:8080/doc.html) 查看 API 文档并测试接口。

---

## 关键服务和功能说明

1. **用户服务**：
    - **注册/登录**：支持用户注册与登录，使用 JWT 进行身份认证。
    - **用户信息管理**：提供用户基本信息的查看和更新接口。

2. **商品服务**：
    - **商品列表**：查询商品信息，支持分页、排序和条件筛选。
    - **商品详情**：根据商品 ID 获取商品的详细信息。

3. **购物车服务**：
    - **添加到购物车**：用户可以将商品添加到购物车。
    - **查看购物车**：获取用户购物车中的商品列表。

4. **订单服务**：
    - **创建订单**：用户可以通过购物车生成订单。
    - **订单详情**：查看订单信息，包括支付状态和发货信息。

5. **管理端服务**：
    - **商品管理**：管理员可以新增、编辑或删除商品。
    - **订单管理**：管理员可以查看订单并更新订单状态。
    - **用户管理**：查看和管理用户角色及权限。

---

## 未来改进

- **Redis 缓存（已实现部分）**：未来计划引入 Redis 来缓存热数据，如商品列表、热门商品等，提高系统响应速度。
- **更多第三方服务集成**：例如引入第三方支付服务和物流追踪服务。
- **Docker 支持（已实现）**：将后端服务打包为 Docker 镜像，简化部署流程。

---

如有任何问题或建议，欢迎提出 Issue。