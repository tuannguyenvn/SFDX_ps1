public abstract class Template {
  public string name;
  public string instructions;

  public abstract void printDescription();

  public void printName() {
    System.debug('name: ' + name + 'instruction: ' + instructions);
  }
}
