column_padding = 3

art = {
  source = "./logos/logo.txt"
}

function fetch()
  return {
    columns = {
      art.out,
      {
	color.bright_red(user.name .. "@" .. host.name),
        color.red("os:"),
      	color.yellow("Uptime"),
        color.green("kernel:"),
        color.cyan("cpu:"),
        color.blue("gpu:"),
        color.magenta("ram:"),
      },
      {
	"",
        string.lower(os.name),
      	string.lower(uptime.pretty),
        string.lower(kernel.sysname).." "..kernel.release,
        string.lower(cpu.name),
        string.lower(gpu.name),
        string.format("%.1fGB/%.1fGB (%.1f%%)", memory.used_gb, memory.total_gb, memory.percent),
      }
    }
  }
end
