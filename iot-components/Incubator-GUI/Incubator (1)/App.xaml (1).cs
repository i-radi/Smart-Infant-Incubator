using System.Windows;
using Incubator.Services;

namespace Incubator;

/// <summary>
/// Interaction logic for App.xaml
/// </summary>
public partial class App : Application
{
    protected override async void OnStartup(StartupEventArgs e)
    {
        base.OnStartup(e);
        await PipeService.Init();
    }

    protected override void OnExit(ExitEventArgs e)
    {
        base.OnExit(e);
        PipeService.Stop();
    }
}