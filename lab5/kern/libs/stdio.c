#include <defs.h>
#include <stdio.h>
#include <console.h>
#include <sync.h>

/* HIGH level console I/O */

// 保护控制台输出的锁
static bool cprintf_lock = 0;

/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt)
{
    cons_putc(c);
    (*cnt)++;
}

/* *
 * vcprintf - format a string and writes it to stdout
 *
 * The return value is the number of characters which would be
 * written to stdout.
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int vcprintf(const char *fmt, va_list ap)
{
    int cnt = 0;
    vprintfmt((void *)cputch, &cnt, fmt, ap);
    return cnt;
}

/* *
 * cprintf - formats a string and writes it to stdout
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int cprintf(const char *fmt, ...)
{
    va_list ap;
    int cnt;
    bool intr_flag;
    local_intr_save(intr_flag);  // 关中断保护输出原子性
    va_start(ap, fmt);
    cnt = vcprintf(fmt, ap);
    va_end(ap);
    local_intr_restore(intr_flag);  // 恢复中断
    return cnt;
}

/* cputchar - writes a single character to stdout */
void cputchar(int c)
{
    cons_putc(c);
}

/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int cputs(const char *str)
{
    int cnt = 0;
    char c;
    while ((c = *str++) != '\0')
    {
        cputch(c, &cnt);
    }
    cputch('\n', &cnt);
    return cnt;
}

/* getchar - reads a single non-zero character from stdin */
int getchar(void)
{
    int c;
    while ((c = cons_getc()) == 0)
        /* do nothing */;
    return c;
}
