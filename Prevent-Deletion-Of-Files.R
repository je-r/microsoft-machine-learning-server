
# by using .outFile argument not equal to NULL:
xdf %>% filter(...) %>% mutate(..., .outFile="final/output.xdf")

# by using persist verb:
xdf %>% filter(...) %>% mutate(...) %>% persist("final/output.xdf")
