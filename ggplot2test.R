library(ggplot2)
# 读取同文件夹的csv文件，第一行为列字段名，分隔符为制表符
RMR <- read.csv('Rmr.csv',header= TRUE,sep = "\t")
head(RMR)
# 使用spline()进行数据拟合
# tem <- as.data.frame(spline(RMR$rmr, RMR$c, n=100))

ggplot(RMR, aes(x = rmr , y = c)) +
  geom_point() + 
  # 按数据点绘制折线图
  geom_line() +
  # 按数据点绘制平滑曲线
  # geom_smooth(data = tem, aes(x=x, y=y), se = F) +
  # 反转Y轴、设置坐标单位为百分数、坐标间隔为10%
  scale_y_reverse(labels = scales::percent_format(accuracy = 1),breaks = seq(from = 0, to = 1, by = 0.1)) +
  # 设置X轴坐标单位为百分数、坐标间隔为10%
  scale_x_continuous(labels = scales::percent_format(accuracy = 1), breaks = seq(from = 0, to = 1, by = 0.1))  + 
  # 配置坐标轴起始值显示
  expand_limits(x = 0,y = 1) +
  # 绘制翻转Y轴下方阴影，透明度为50%；未反转直接使用geom_area()
  geom_ribbon(aes(x = rmr, ymin = c, ymax = 1),alpha = 0.5)  


